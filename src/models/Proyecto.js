const { DataTypes } = require('sequelize');
const sequelize = require('../database/conexion');

module.exports = sequelize.define('proyectos', {
  titulo: { type: DataTypes.STRING, allowNull: false },
  descripcion: DataTypes.TEXT,
  tecnologias: DataTypes.STRING,
  empresa: DataTypes.STRING,
  fecha: DataTypes.DATEONLY,
  enlace: DataTypes.STRING,
}, { timestamps: false });
