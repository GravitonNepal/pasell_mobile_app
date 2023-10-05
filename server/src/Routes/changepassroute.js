// const updateuser = async (req, res) => {
//     console.log(body);
//     const { id, passwordd, newpassword } = req.body;

//     const data = {
//         category: category,
//         picture: picture
//     }
//     console.log(data);

//     var result = await Category.findByIdAndUpdate(id, data)
//     if (result?.status) {
//         res.json({
//             resp: true,
//             msj: 'Category updated Successfully'
//         });
//     }
//     else {
//         res.json({
//             resp: false,
//             msj: 'There is some error updating category'
//         });
//     }
// }