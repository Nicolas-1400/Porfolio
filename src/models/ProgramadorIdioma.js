const { DataTypes } = require("sequelize");
const sequelize = require("../database/conexion");

module.exports = sequelize.define(
  "programadores_idiomas",
  {
    programadorId: DataTypes.INTEGER,
    idiomaId: DataTypes.INTEGER,
    nivel: DataTypes.ENUM("Básico", "Intermedio", "Avanzado"),
  },
  { timestamps: false }
);
