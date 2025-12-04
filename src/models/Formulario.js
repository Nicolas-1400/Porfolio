const { DataTypes } = require('sequelize');
const sequelize = require('../database/conexion');

module.exports = sequelize.define(
  'formulario',
  {
    nombre: { type: DataTypes.STRING, allowNull: false },
    email: { type: DataTypes.STRING, allowNull: false },
    mensaje: { type: DataTypes.TEXT, allowNull: false },
  },
  { timestamps: false, freezeTableName: true }
);
