const { DataTypes } = require('sequelize');
const sequelize = require('../database/conexion');

module.exports = sequelize.define('programadores', {
  nombre: { type: DataTypes.STRING, allowNull: false },
  apellidos: { type: DataTypes.STRING, allowNull: false },
  titulacion: DataTypes.STRING,
  linkedin: DataTypes.STRING,
  email: { type: DataTypes.STRING, allowNull: false, unique: true },
  numeroTelefono: DataTypes.STRING,
}, { timestamps: false });
