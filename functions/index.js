const functions = require("firebase-functions");
const nodemailer = require("nodemailer");
const cors = require("cors")({origin: true});

// Configurez votre transporteur d'email
const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: "spysschaert.ludo@gmail.com",
    pass: "Ludo03121971", // ⚠️ À sécuriser avec des variables d'env ensuite
  },
});

// Fonction HTTP pour envoyer un email
exports.sendEmail = functions.https.onRequest((req, res) => {
  cors(req, res, async () => {
    if (req.method !== "POST") {
      return res.status(405).send({error: "Méthode non autorisée"});
    }

    const {name, surname, email, message} = req.body;

    if (!name || !surname || !email || !message) {
      return res.status(400).send({error: "Données manquantes"});
    }

    const mailOptions = {
      from: `"Formulaire de contact" <spysschaert.ludo@gmail.com>`,
      to: "spysschaert.ludo@gmail.com",
      replyTo: email,
      subject: "Nouveau message de contact",
      text: `Nom: ${name}\nPrénom: ${surname}\nEmail:
      ${email}\n\nMessage: ${message}`,
      html: `
        <h2>Nouveau message de contact</h2>
        <p><strong>Nom:</strong> ${name}</p>
        <p><strong>Prénom:</strong> ${surname}</p>
        <p><strong>Email:</strong> ${email}</p>
        <p><strong>Message:</strong></p>
        <p>${message.replace(/\n/g, "<br>")}</p>
      `,
    };

    try {
      await transporter.sendMail(mailOptions);
      console.log("Email envoyé avec succès");
      res.status(200).send({success: true});
    } catch (error) {
      console.error("Erreur lors de l'envoi de l'email:", error);
      res.status(500).send({error:
       "Erreur lors de l'envoi de l'email", detail: error.message});
    }
  });
});
