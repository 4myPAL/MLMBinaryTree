$(document).ready ->
  Raphael.fn.line = (startX, startY, endX, endY) ->
    @.path('M' + startX + ' ' + startY + ' L' + endX + ' ' + endY)
  
  paths = new Array()
  window.paper = Raphael("container", 400, 400)
  attr = {fill: '#000'}
  
  nodes = [
    {"id":800,"name":"User800","parent_id":400,"left_id":1600,"right_id":1601,"added_by_id":419},
    {"id":1600,"name":"User1600","parent_id":800,"left_id":3200,"right_id":3201,"added_by_id":929},
    {"id":3200,"name":"User3200","parent_id":1600,"left_id":null,"right_id":null,"added_by_id":1772},
    {"id":3201,"name":"User3201","parent_id":1600,"left_id":null,"right_id":null,"added_by_id":454},
    {"id":1601,"name":"User1601","parent_id":800,"left_id":3202,"right_id":3203,"added_by_id":338},
    # {"id":3202,"name":"User3202","parent_id":1601,"left_id":null,"right_id":null,"added_by_id":314},
    # {"id":3203,"name":"User3203","parent_id":1601,"left_id":null,"right_id":null,"added_by_id":2951}
  ]
  
  level = (nodes.length - 1) / 2
  
  window.tree = new BinaryTree(nodes)
  console.log(tree.root)
  
  # paper.circle(200,20,10).attr(attr)
  # paper.circle(140,50,10).attr(attr)
  # paper.circle(260,50,10).attr(attr)
  # paper.line(200,20,170,50)
  # paper.line(200,20,230,50)
  #
  # paper.circle(110,80,10).attr(attr)
  # paper.circle(170,80,10).attr(attr)
  # paper.line(170,50,140,80)
  # paper.line(170,50,200,80)
  #
  # paper.circle(230,80,10).attr(attr)
  # paper.circle(290,80,10).attr(attr)
  #
  # paper.forEach (el) ->
  #   if el.type is "path"
  #     paths.push(el.id)
  #   return
  #
  # for id in paths
  #   paper.getById(id).remove()
  #   return