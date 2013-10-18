chai = require "chai"
sinon = require "sinon"
chai.use require "sinon-chai"

expect = chai.expect

describe "Shake Shack", ->
  shakeshack_module = require("../src/shakeshack")

  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()
    @msg =
      send: sinon.spy()
      random: sinon.spy()
    @shakeshack_module = shakeshack_module(@robot)

  describe "Get shake shack line photo", ->

    it "registers a respon listener", ->
      expect(@robot.respond).to.have.been.calledWith(/(shake|shack) cam/)

    it "should send a image url", ->
      cb = @robot.respond.firstCall.args[1]
      cb(@msg)
      expect(@msg.send).to.have.been.calledWithMatch("http://www.shakeshack.com/camera.jpg")
