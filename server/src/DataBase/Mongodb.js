const mongoose = require('mongoose');

mongoose.connect('mongodb://0.0.0.0:27017/PASELLAPP', {
    useUnifiedTopology: true,
    useNewUrlParser: true,
    useFindAndModify:false,
    useCreateIndex:true,
   
}).then( db => console.log('Pasell Database is Successfully Connnected'))
.catch(err => console.log(err));


