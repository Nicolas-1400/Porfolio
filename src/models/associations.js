const Programador = require('./Programador');
const Idioma = require('./Idioma');
const Tecnologia = require('./Tecnologias');
const Proyecto = require('./Proyecto');
const ProgramadorIdioma = require('./ProgramadorIdioma');
const ProgramadorTecnologia = require('./ProgramadorTecnologia');
const ProgramadorProyecto = require('./ProgramadorProyecto');

Programador.belongsToMany(Idioma, { through: ProgramadorIdioma, foreignKey: 'programadorId', otherKey: 'idiomaId', as: 'Idiomas' });
Idioma.belongsToMany(Programador, { through: ProgramadorIdioma, foreignKey: 'idiomaId', otherKey: 'programadorId', as: 'Programadores' });

Programador.belongsToMany(Tecnologia, { through: ProgramadorTecnologia, foreignKey: 'programadorId', otherKey: 'tecnologiaId', as: 'Tecnologias' });
Tecnologia.belongsToMany(Programador, { through: ProgramadorTecnologia, foreignKey: 'tecnologiaId', otherKey: 'programadorId', as: 'Programadores' });

Programador.belongsToMany(Proyecto, { through: ProgramadorProyecto, foreignKey: 'programadorId', otherKey: 'proyectoId', as: 'Proyectos' });
Proyecto.belongsToMany(Programador, { through: ProgramadorProyecto, foreignKey: 'proyectoId', otherKey: 'programadorId', as: 'Programadores' });

// Este archivo se requiere por sus efectos secundarios (definir asociaciones).
