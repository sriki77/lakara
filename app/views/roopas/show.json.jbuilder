unless @roopa.empty?
  @first_roopa= @roopa[0]

  json.roopa @first_roopa.name
  json.desc "#{@first_roopa.dhatu.name} #{ApplicationHelper::DHATU}, #{@first_roopa.dhatu.padam.name} "

  matches = []
  @roopa.each do |r|
    matches << "#{r.lakaras.name} #{ApplicationHelper::LAKARA}, #{r.purusha.name}, #{r.vachanam.name}"
  end
  json.matches details

  dhatu=@first_roopa.dhatu
  json.lakaras Lakaras.all do |l|
    json.name l.name + " " +ApplicationHelper::LAKARA
    table=[]
    table<<Vachanam.all.collect { |v| v.name }.unshift("-")
    Purusha.all.each do |p|
      row=[]
      row << p.name
      Vachanam.all.each do |v|
        r=dhatu.roopas.find { |r| r.lakaras==l && r.purusha==p && r.vachanam==v }
        row << (r ? r.name : "-")
      end
      table << row
    end
    json.table table
  end
end