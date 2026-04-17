const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/database');

const Solution = sequelize.define('Solution', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  type: {
    type: DataTypes.ENUM('oa', 'erp', 'crm', 'custom'),
    allowNull: false,
    unique: true
  },
  title: {
    type: DataTypes.STRING,
    allowNull: false
  },
  description: {
    type: DataTypes.TEXT
  },
  content: {
    type: DataTypes.TEXT
  },
  features: {
    type: DataTypes.JSON
  },
  benefits: {
    type: DataTypes.JSON
  },
  images: {
    type: DataTypes.JSON
  }
}, {
  timestamps: true
});

module.exports = Solution;
