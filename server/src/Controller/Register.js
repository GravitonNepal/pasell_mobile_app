
const { response } = require('express');
const Users = require('../Models/Users');
const bcrypt = require('bcrypt');
const Person = require('../Models/Person');
const {ROLES_LIST} = require("../Utils/RolesList")


const createUsers = async ( req, res = response ) => {

    const a= { username, email, passwordd } = req.body;
    console.log(a.username);

    const salt = bcrypt.genSaltSync();
    const pass = bcrypt.hashSync( passwordd, salt );

    const person = new Person({
        firstName: username
    });


    person.save( (err, persondb ) => {

        if( err ){
            return res.status(400).json({
                resp: false,
                msj : 'Error registerig user',
                err
            });
        }

        const user = new Users({
            users: username,
            email: email,
            passwordd: pass,
            role: ROLES_LIST.User,
            person_id: persondb._id
        });

        user.save( (err, userdb ) => {

            if( err ){
                return res.status(400).json({
                    resp: false,
                    msj : 'Email already exists' ,
                    err
                });
            }
    
            res.json({
                resp: true,
                msj: 'User ' + userdb.users + ' was created successfully',
            })
    
        });

    });

    
};
const getuserid = async (req, res) => {
    // console.log('get productById', req.params.product);
  
    var v = await Users.findById(req.params.id);
    // b= v.toString();
    console.log("v");
    console.log("a", v);
    if (v?.status) {
        res.json({
            resp: false,
            msj: 'A'
        });
    }
    else {
        res.json({
            resp: true,
            msj: 'user id',
            v: v
        });
    }
}


module.exports = {
    createUsers,
    getuserid
};