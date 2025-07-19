const ApiError = require("../utils/error")
const TeamModel = require("../model/team_model")
const { EMPLOYEE_ROLE } = require("../config/string");
// const { teamValidation } = require("../config/joi.validation")

async function addTeam(req, res, next) {
    try {
        req.body.companyId = req.id

        // const teamValid = teamValidation.validate(req.body)
        // if (teamValid.error) {
        //     return next(new ApiError(403, teamValid.error.details[0].message))
        // }

        const team = new TeamModel(req.body)
        await team.save()
        res.status(201).json({ statusCode: 201, success: true, data: team, message: "team created successfully" })
    } catch (e) {
        next(new ApiError(400, e.message))
    }
}

async function getTeam(req, res, next) {
    try {
      //  debugger;
        if (req.role === EMPLOYEE_ROLE) {
            const teams = await TeamModel.find({
                $or: [
                    { children: req.id },
                    { "leader.leaderId": req.id }
                ]
            })
            .populate("projectTitle")
            .populate({
                path: "leader.leaderId",
                populate: [
                    { path: "designation" },
                    { path: "department" }
                ]
            })
            .populate({
                path: "leader.children",
                populate:[ { path: "designation" } ,  { path: "department" }]
            });
        
            const workingTeam = teams.filter((data) => data.isWorking === true);
            res.status(200).json({ success: true, data: workingTeam });
        }
        else {
            const teams = await TeamModel.find({ companyId: req.id })
                .populate("projectTitle")
                .populate({
                    path: "leader.leaderId",
                    populate:[ { path: "designation" } ,  { path: "department" }]
                })
                .populate({
                    path: "leader.children",
                    populate:[ { path: "designation" } ,  { path: "department" }]
                });
            
            const workingTeam = teams.filter((data) => data.isWorking === true);
            res.status(200).json({ success: true, data: workingTeam });
        }
    } catch (e) {
        next(new ApiError(400, e.message));
    }
}

async function updateTeam(req, res, next) {
    try {
        const team = await TeamModel.findByIdAndUpdate({ _id: req.params.id }, { $set: req.body }, { new: true });
        res.status(200).json({ statusCode: 200, success: true, data: team, message: "team details updated successfully" });
    } catch (e) {
        next(new ApiError(400, e.message))
    }
}

async function deleteTeam(req, res, next) {
    try {
        await TeamModel.findByIdAndUpdate({ _id: req.params.id }, { $set: { isWorking: false } }, { new: true })
        res.status(200).json({ statusCode: 200, success: true, message: "team delete sucessfully" })
    } catch (e) {
        next(new ApiError(400, e.message))
    }
}

module.exports = { addTeam, getTeam, updateTeam, deleteTeam }