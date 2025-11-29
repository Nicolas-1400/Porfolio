const { DataTypes } = require('sequelize');
const sequelize = require('../database/connection');

const Idioma = sequelize.define('idiomas', {
  nombre: { type: DataTypes.STRING, allowNull: false }
}, { timestamps: false });

module.exports = Idioma;
