const { DataTypes } = require('sequelize');
const sequelize = require('../database/conexion');

const ProgramadorProyecto = sequelize.define('programadores_proyectos', {
  programadorId: DataTypes.INTEGER,
  proyectoId: DataTypes.INTEGER
}, { timestamps: false });

module.exports = ProgramadorProyecto;
