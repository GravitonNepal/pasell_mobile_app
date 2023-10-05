const { Schema, model } = require("mongoose");

// search model

const searchSchema = new Schema({
	id: {
		type: String,
		required: true,
	},

	keyword: {
		type: String,
		required: true,
	},
});

module.exports = model("search", searchSchema);
