const { DataTypes } = require('sequelize');
const sequelize = require('../database/conexion');

const Tecnologia = sequelize.define('tecnologias', {
  nombre: { type: DataTypes.STRING, allowNull: false }
}, { timestamps: false });

module.exports = Tecnologia;
