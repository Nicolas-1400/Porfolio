const express = require('express');
const path = require('path');
const exphbs = require('express-handlebars');
const sequelize = require('./database/connection');

const Programador = require('./models/Programador');
const Proyecto = require('./models/Proyecto');
const Tecnologia = require('./models/Tecnologia');
const Idioma = require('./models/Idioma');
const PT = require('./models/ProgramadorTecnologia');
const PI = require('./models/ProgramadorIdioma');
const PP = require('./models/ProgramadorProyecto');
const Formulario = require('./models/Formulario');

// Asociaciones
Programador.belongsToMany(Tecnologia, { through: PT, foreignKey: 'programadorId', otherKey: 'tecnologiaId' });
Tecnologia.belongsToMany(Programador, { through: PT, foreignKey: 'tecnologiaId', otherKey: 'programadorId' });

Programador.belongsToMany(Idioma, { through: PI, foreignKey: 'programadorId', otherKey: 'idiomaId' });
Idioma.belongsToMany(Programador, { through: PI, foreignKey: 'idiomaId', otherKey: 'programadorId' });

Programador.belongsToMany(Proyecto, { through: PP, foreignKey: 'programadorId', otherKey: 'proyectoId' });
Proyecto.belongsToMany(Programador, { through: PP, foreignKey: 'proyectoId', otherKey: 'programadorId' });

// Express + Handlebars
const app = express();
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

app.engine('hbs', exphbs.engine({
  extname: 'hbs',
  defaultLayout: 'main',
  layoutsDir: path.join(__dirname, 'views/layouts'),
  partialsDir: path.join(__dirname, 'views/partials')
}));
app.set('view engine', 'hbs');
app.set('views', path.join(__dirname, 'views'));

// Rutas
app.use('/', require('./routes/index'));
app.use('/programadores', require('./routes/programadores'));
app.use('/proyectos', require('./routes/proyectos'));
app.use('/contacto', require('./routes/formulario'));

// Arranca DB y servidor
(async () => {
  try {
    await sequelize.authenticate();
    console.log('DB conectada OK');

    // No forzamos sync para no borrar datos. Solo aseguramos modelos.
    await sequelize.sync({ alter: false });
    console.log('Modelos sincronizados');

    const PORT = 3000;
    app.listen(PORT, () => console.log(`Servidor en http://localhost:${PORT}`));
  } catch (err) {
    console.error('Error iniciando app:', err);
  }
})();
