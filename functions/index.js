const functions = require("firebase-functions");
const express = require("express");
const nodemailer = require("nodemailer");
const cors = require("cors")({origin: true});
const app = express();
const admin = require("firebase-admin");

admin.initializeApp();

// Utilisez CORS middleware
app.use(cors);


const gmailConfig = {
  user: process.env.GMAIL_USER || "spysschaert.ludo@gmail.com",
  pass: process.env.GMAIL_PASS || "whvm fjtc ilmt bzkc",
};

// Transporteur pour l'envoi d'emails
const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: gmailConfig.user,
    pass: gmailConfig.pass,
  },
});

// Fonction API (Express)
exports.api = functions.https.onRequest((req, res) => {
  const app = express();

  // Route simple
  app.get("/", (req, res) => {
    res.send("Service running");
  });

  // Important: Faire passer la requête à l'application Express
  return app(req, res);
});

// Fonction callable depuis Flutter
exports.sendEmail = functions.https.onCall(async (data, context) => {
  try {
    if (!data.name || !data.surname || !data.email || !data.message) {
      throw new functions.https.HttpsError(
          "invalid-argument",
          "Tous les champs sont obligatoires",
      );
    }

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(data.email)) {
      throw new functions.https.HttpsError("invalid-argument",
          "Email invalide");
    }

    const mailOptions = {
      from: `"Formulaire de contact" <${gmailConfig.user}>`,
      to: gmailConfig.user,
      replyTo: data.email,
      subject: `Nouveau message de ${data.name} ${data.surname}`,
      text: `Nom: ${data.name}\nPrénom: ${data.surname}\nEmail:
    ${data.email}\nMessage:\n${data.message}`,
      html: `<h2>Nouveau message</h2>
           <p><strong>Nom:</strong> ${data.name}</p>
           <p><strong>Prénom:</strong> ${data.surname}</p>
           <p><strong>Email:</strong> <a href="mailto:${data.email}">
           ${data.email}</a></p>
           <p><strong>Message:</strong></p>
           <p>${data.message.replace(/\n/g, "<br>")}</p>`,
    };


    await transporter.sendMail(mailOptions);
    return {success: true, message: "Email envoyé avec succès"};
  } catch (error) {
    console.error("Erreur d'envoi d'email:", error);
    throw new functions.https.HttpsError("internal", "Erreur lors de l'envoi", {
      detail: error.message,
    });
  }
});
