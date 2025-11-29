const { DataTypes } = require('sequelize');
const sequelize = require('../database/connection');

const ProgramadorTecnologia = sequelize.define('programadores_tecnologias', {
  programadorId: DataTypes.INTEGER,
  tecnologiaId: DataTypes.INTEGER,
  nivel: DataTypes.ENUM('Básico','Intermedio','Avanzado')
}, { timestamps: false });

module.exports = ProgramadorTecnologia;
