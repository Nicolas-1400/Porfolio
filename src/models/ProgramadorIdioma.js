const { DataTypes } = require('sequelize');
const sequelize = require('../database/conexion');

const ProgramadorIdioma = sequelize.define('programadores_idiomas', {
  programadorId: DataTypes.INTEGER,
  idiomaId: DataTypes.INTEGER,
  nivel: DataTypes.ENUM('Básico','Intermedio','Avanzado')
}, { timestamps: false });

module.exports = ProgramadorIdioma;
