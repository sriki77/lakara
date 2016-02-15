unless @roopa.empty?
  @first_roopa= @roopa[0]

  json.roopa @first_roopa.name
  json.desc "#{@first_roopa.dhatu.name} #{ApplicationHelper::DHATU}, #{@first_roopa.dhatu.padam.name}"
  json.dhatuDesc "#{@first_roopa.dhatu.description}"

  matches = []
  @roopa.each do |r|
    matches << "#{r.lakaras.name} #{ApplicationHelper::LAKARA}, #{r.purusha.name}, #{r.vachanam.name}"
  end
  json.matches matches

  dhatu=@first_roopa.dhatu
  json.lakaras @allLakaras do |l|
    json.name l.name + " " +ApplicationHelper::LAKARA
    table=[]
    table<<@allVachanas.collect { |v| v.name }.unshift("-")
    @allPurushas.each do |p|
      row=[]
      row << p.name
      @allVachanas.each do |v|
        r=dhatu.roopas.find { |r| r.lakaras==l && r.purusha==p && r.vachanam==v }
        row << (r && r.name ? r.name : "-")
      end
      table << row
    end
    json.table table
  end
end