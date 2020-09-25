require 'net/http'
require 'open-uri'
require 'json'
 
class GetPrograms
 
  URL = "https://www.dnd5eapi.co/api/equipment"
 
  def get_programs
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end
  
  def program_school
    names = []
    programs = JSON.parse(self.get_programs)
    programs["results"].each do |hash|
      names << hash["name"]
    end
    names.join(", ")
  end
 
end
 
#programs = GetPrograms.new.get_programs
#puts programs

programs = GetPrograms.new
puts programs.program_school
