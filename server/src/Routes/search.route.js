const express = require("express");
const router = express.Router();

const Product = require("../Models/Products");

//search product by name or description 
router.get("/search/:search", async (req, res) => {
	const search = req.params.search;
	console.log(search);

	const regex = new RegExp(search, "i");

	const products = await Product.find({
		$or: [{ name: regex }, { description: regex }],
	});

	res.json({
		resp: true,
		msj: "List to productsss",
		products,
	});
});






module.exports = router;
