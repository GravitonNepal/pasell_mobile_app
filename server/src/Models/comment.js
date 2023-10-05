// create comment model

const { Schema, model } = require("mongoose");

const commentSchema = new Schema({
    product_id: {
        type: Schema.Types.ObjectId,
        ref: "products",
    },
    user_id: {
        type: Schema.Types.ObjectId,
        ref: "users",
    },
    comment: {
        type: String,
        required: true,
    },
    status: {
        type: Boolean,
        default: true,
        required: true,
    },
});

module.exports = model("comment", commentSchema);
