const { Schema, model } = require("mongoose")

const teamSchema = new Schema({
    companyId: {
        type: Schema.Types.ObjectId,
        ref: "companies",
        required: true
    },
    project: {
        type: Schema.Types.ObjectId,
        ref: "project",
        required: true
    },
    leader:{
        leaderId:{
            type:Schema.Types.ObjectId,
            ref:"employees",
            required:true
        },
        children:[{
            type:Schema.Types.ObjectId,
            ref:"employees",
            required:true
        }],
    },
    isWorking:{
        type:Boolean,
        default:true
    }
},{
    timestamps: true,
    toJSON: {
        virtuals: true,
        versionKey: false,
    }
})

const TeamModel = model("team", teamSchema)

module.exports = TeamModel