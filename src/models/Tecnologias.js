const { DataTypes } = require('sequelize');
const sequelize = require('../database/connection');

const Tecnologia = sequelize.define('tecnologias', {
  nombre: { type: DataTypes.STRING, allowNull: false }
}, { timestamps: false });

module.exports = Tecnologia;
