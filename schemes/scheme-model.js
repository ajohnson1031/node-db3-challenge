const db = require("../data/db-config.js");

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes")
    .where({ id })
    .first();
}

function findSteps(id) {
  return db
    .select("id", "step_number", "instructions")
    .from("steps")
    .where({ scheme_id: id });
}

function add(scheme) {
  return db("schemes")
    .insert(scheme)
    .then(scheme => findById(scheme[0]));
}

function update(changes, id) {
  return db("schemes")
    .where({ id })
    .update(changes)
    .then(_ => findById(id));
}

function remove(id) {
  return db("schemes")
    .where({ id })
    .del();
}

module.exports = { find, findById, findSteps, add, update, remove };
