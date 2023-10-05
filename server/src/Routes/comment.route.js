// create comment route

const express = require("express");
const router = express.Router();

const Comment = require("../Models/comment");
const Product = require("../Models/Products");
const { validateToken } = require("../Middlewares/ValidateToken");

router.post("/comment", async (req, res) => {
	// console.log(aaaassss);
	const { uidProduct, uidUser, comment } = req.body;

	const product = await Product.findById(uidProduct);
console.log(product);
	if (!product) {
		return res.status(400).json({
			resp: false,
			msj: "Product not found",
		
		});
	}

	const newComment = new Comment({
		product_id: uidProduct,
		user_id: uidUser,
		comment,
	});

	await newComment.save();

	res.json({
		resp: true,
		msj: "Comment created",
		comment: newComment,
	});
});

router.get("/comment/:uidProduct", async (req, res) => {
	const uidProduct = req.params.uidProduct;

	const product = await Product.findById(uidProduct);

	if (!product) {
		return res.status(400).json({
			resp: false,
			msj: "Product not found",
		});
	}

	const comments = await Comment.find({ product_id: uidProduct }).populate(
		"user_id",
		"name"
	);

	res.json({
		resp: true,
		msj: "List to comments",
		comments,
	});
});

module.exports = router;
