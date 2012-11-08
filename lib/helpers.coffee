exports.buildFamilyData = (members, rels) ->
  families = []
  for rel in rels
    family = {}
    member1 = members[rel.members[0]]
    member2 = members[rel.members[1]]
    family.name = member1.first_name+' and '+member2.first_name+' '+member1.last_name
    family.comments = rel.comments
    family.address = member1.address
    family.city = member1.city
    family.state = member1.state
    family.zip = member1.zip
    family.emails = [member1.email, member2.email]
    family.phones = [member1.phone, member2.phone]
    family.birthdays = [member1.birthday, member2.birthday]

    families.push family

  families

exports.addIndex = (data) ->
  for datum, index in data
    datum.index = index
  data

exports.sanitize = (data) ->
  return data.replace(/_/g,'\\_').replace(/#/g,'\\#')

exports.printDate = (date) ->
  month = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
  d = new Date(date)
  return month[d.getMonth()]+' '+d.getDate()
