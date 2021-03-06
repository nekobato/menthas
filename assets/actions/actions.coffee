request = require 'superagent'

module.exports = ()->
  item:
    fetch: (category,offset = 0)->
      that = @
      request.get "/#{category}/list?offset=#{offset}",(err,res)->
        return console.log err if err
        json = JSON.parse res.text
        that.dispatch "insertItemList",json.items

    reload: (category,offset = 0)->
      that = @
      request.get "/#{category}/list?offset=#{offset}",(err,res)->
        return console.log err if err
        json = JSON.parse res.text
        that.dispatch "reloadItemList",json.items


  category:
    fetchParams: (category)->
      that = @
      request.get "/#{category}/params",(err,res)->
        return console.log err if err
        json = JSON.parse res.text
        that.dispatch "fetchCategoryParams",json.category