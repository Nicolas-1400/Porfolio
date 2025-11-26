const express = require('express');
const exhbs = require('express-handlebars');

const app = express();

// Caché
// app.enable('view cache');

// Configuración de Handlebars
app.engine('handlebars', exhbs.engine());
app.set('view engine', 'handlebars');

// Configuración del ruteo

app.get('/', (req, res) => {
    res.render('home', {
        title: "Bienvenidos a mi sitio",
        subtitle: "Gracias por venir!",
        arrLang: ["JavaScript", "PHP", "Java", "C#"],
        content: "Este es un párrafo de ejemplo para mostrar cómo funciona Handlebars con Express."
    });
});


// Como buenas practicas utilizamos el ruteo con la carpeta routes

app.get('/home', (req, res) => {
    res.render('home', {
        title: "Bienvenidos a mi sitio",
        subtitle: "Gracias por venir!",
        arrLang: ["JavaScript", "PHP", "Java", "C#"],
        content: "Este es un párrafo de ejemplo para mostrar cómo funciona Handlebars con Express."
    });
});

app.get('/clientes', (req, res) => {
    res.render('clientes');
});

const mysite = require("./routes/misitio");
app.use('/misitio', mysite);
app.use(express.static("public"));

app.listen(3000);

