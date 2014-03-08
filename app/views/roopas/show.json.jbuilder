if @roopa
  json.roopa @roopa.name
  json.desc "#{@roopa.dhatu.name} #{ApplicationHelper::DHATU} #{@roopa.padam.name} #{@roopa.lakaras.name} #{ApplicationHelper::LAKARA} #{@roopa.purusha.name} #{@roopa.vachanam.name}"

  dhatu=@roopa.dhatu
  json.lakaras Lakaras.all do |l|
    json.name l.name + " " +ApplicationHelper::LAKARA
    table=[]
    table<<Vachanam.all.collect { |v| v.name }.unshift("-")
    Purusha.all.each do |p|
      row=[]
      row << p.name
      Vachanam.all.each do |v|
        r=dhatu.roopas.find{ |r| r.lakaras==l && r.purusha==p && r.vachanam==v }
        row << (r ? r.name: "-")
      end
      table << row
    end
    json.table table
  end
end