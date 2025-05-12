const {onCall} = require("firebase-functions/v2/https");
const {onRequest} = require("firebase-functions/v2/https");
const {logger} = require("firebase-functions");
const admin = require("firebase-admin");
const nodemailer = require("nodemailer");
const cors = require("cors")({origin: true});

admin.initializeApp();

// Configuration avec fallback si les variables ne sont pas définies
const gmailConfig = process.env.GMAIL_USER && process.env.GMAIL_PASS ?
  {
    user: process.env.GMAIL_USER,
    pass: process.env.GMAIL_PASS,
  } :
  {
    user: "spysschaert.ludo@gmail.com",
    pass: "whvm fjtc ilmt bzkc",
  };

// Configuration du transporteur
const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: gmailConfig.user,
    pass: gmailConfig.pass,
  },
  tls: {
    rejectUnauthorized: false,
  },
});


exports.sendEmail = onCall(
    {
      region: "us-central1",
      timeoutSeconds: 60,
      memory: "512MiB",
      cpu: 1,
    },
    async (request, context) => {
      // Log complet des données reçues pour le débogage
      logger.info("Données reçues complètes:", request);


      let inputData;

      // Si les données sont dans request.data (structure normale)
      if (request.data && typeof request.data === "object") {
        inputData = request.data;
      } else if (typeof request === "object") {
        inputData = request;
      } else {
        logger.error("Structure de données invalide:", request);
        throw new Error("Structure de données invalide");
      }

      logger.info("Données extraites:", inputData);

      // Vérifier les champs requis
      const requiredFields = ["name", "surname", "email", "message"];
      const missingFields = requiredFields.filter((field) => !inputData[field]);

      if (missingFields.length > 0) {
        logger.error("Champs manquants:", missingFields);
        throw new Error(`Champs manquants : ${missingFields.join(", ")}`);
      }

      if (!/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(inputData.email)) {
        logger.error("Format email invalide:", inputData.email);
        throw new Error("Format email invalide");
      }

      try {
        const mailOptions = {
          from: `"Contact Form" <${gmailConfig.user}>`,
          to: gmailConfig.user,
          replyTo: inputData.email,
          subject: `Nouveau message de ${inputData.name} ${inputData.surname}`,
          text: `Nom: ${inputData.name}\nPrénom:
           ${inputData.surname}\nEmail:
           ${inputData.email}\n\nMessage:\n${inputData.message}`,
          html: `<div style="font-family: Arial, sans-serif;">
          <h2 style="color: #336699;">
          Nouveau message de contact</h2>
          <p><strong>Nom :</strong> ${inputData.name}</p>
          <p><strong>Prénom :</strong> ${inputData.surname}</p>
          <p><strong>Email :</strong>
           <a href="mailto:${inputData.email}">${inputData.email}</a></p>
          <p><strong>Message :</strong></p>
          <p style="white-space: pre-line;">${inputData.message}</p>
        </div>`,
        };

        logger.info("Tentative d'envoi d'email à:", gmailConfig.user);
        await transporter.sendMail(mailOptions);
        logger.info("Email envoyé avec succès");

        return {
          success: true,
          message: "Email envoyé avec succès",
          timestamp: new Date().toISOString(),
        };
      } catch (error) {
        logger.error("ERREUR EMAIL:", {
          error: error.message,
          stack: error.stack,
          requestData: inputData,
        });

        throw new Error("Échec de l'envoi du message : " + error.message);
      }
    },
);

// Ajout d'une version HTTP pour les tests et comme solution de secours
exports.sendEmailHttp = onRequest(
    {
      region: "us-central1",
      timeoutSeconds: 60,
      memory: "512MiB",
      cpu: 1,
    },
    async (req, res) => {
      cors(req, res, async () => {
        try {
          logger.info("Requête HTTP reçue:", {
            method: req.method,
            headers: req.headers,
            body: req.body,
          });

          if (req.method !== "POST") {
            res.status(405).send({
              success: false,
              error: "Méthode non autorisée. Utilisez POST.",
            });
            return;
          }


          let inputData = req.body;

          // Si les données sont dans req.body.data (structure possible)
          if (req.body && req.body.data && typeof req.body.data === "object") {
            inputData = req.body.data;
          }

          logger.info("Données extraites (HTTP):", inputData);

          // Vérifier les champs requis
          const requiredFields = ["name", "surname", "email", "message"];
          const missingFields = requiredFields.filter((field) =>
            !inputData[field]);

          if (missingFields.length > 0) {
            logger.error("Champs manquants (HTTP):", missingFields);
            res.status(400).send({
              success: false,
              error: `Champs manquants : ${missingFields.join(", ")}`,
            });
            return;
          }

          if (!/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(inputData.email)) {
            logger.error("Format email invalide (HTTP):", inputData.email);
            res.status(400).send({
              success: false,
              error: "Format email invalide",
            });
            return;
          }

          const mailOptions = {
            from: `"Contact Form" <${gmailConfig.user}>`,
            to: gmailConfig.user,
            replyTo: inputData.email,
            subject: `Nouveau message de
            ${inputData.name} ${inputData.surname}`,
            text: `Nom: ${inputData.name}\nPrénom:
             ${inputData.surname}\nEmail:
             ${inputData.email}\n\nMessage:\n${inputData.message}`,
            html: `<div style="font-family: Arial, sans-serif;">
            <h2 style="color: #336699;">Nouveau message de contact</h2>
            <p><strong>Nom :</strong> ${inputData.name}</p>
            <p><strong>Prénom :</strong> ${inputData.surname}</p>
            <p><strong>Email :</strong>
             <a href="mailto:${inputData.email}">${inputData.email}</a></p>
            <p><strong>Message :</strong></p>
            <p style="white-space: pre-line;">${inputData.message}</p>
          </div>`,
          };

          logger.info("Tentative d'envoi d'email (HTTP) à:", gmailConfig.user);
          await transporter.sendMail(mailOptions);
          logger.info("Email envoyé avec succès (HTTP)");

          res.status(200).send({
            success: true,
            message: "Email envoyé avec succès",
            timestamp: new Date().toISOString(),
          });
        } catch (error) {
          logger.error("ERREUR EMAIL (HTTP):", {
            error: error.message,
            stack: error.stack,
          });

          res.status(500).send({
            success: false,
            error: "Échec de l'envoi du message : " + error.message,
          });
        }
      });
    },
);
