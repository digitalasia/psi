class WeatherController < ApplicationController

	
	def index
		time = Time.zone.now.hour
		logger.info "hello"
		doc2 = Nokogiri::HTML(open('http://app2.nea.gov.sg/anti-pollution-radiation-protection/air-pollution/psi/psi-and-pm2-5-readings'))
		array = doc2.css('td').to_a
		
		@data = array

		case time
		
		when 0
			@answer = array[14].content.strip
			@previous = array[51].content.strip
		when 1
			@answer = array[15].content.strip
			@previous = array[14].content.strip
		when 2
			@answer = array[16].content.strip
			@previous = array[15].content.strip
		when 3
			@answer = array[17].content.strip
			@previous = array[16].content.strip			
		when 4
			@answer = array[18].content.strip
			@previous = array[17].content.strip			
		when 5
			@answer = array[19].content.strip
			@previous = array[18].content.strip			

		when 6
			@answer = array[20].content.strip
			@previous = array[19].content.strip			

		when 7
			@answer = array[21].content.strip
			@previous = array[20].content.strip			

		when 8
			@answer = array[22].content.strip
			@previous = array[21].content.strip			

		when 9
			@answer = array[23].content.strip
			@previous = array[22].content.strip			

		when 10
			@answer = array[24].content.strip
			@previous = array[23].content.strip			

		when 11
			@answer = array[25].content.strip
			@previous = array[24].content.strip			

		when 12
			@answer = array[40].content.strip
			@previous = array[25].content.strip			

		when 13
			@answer = array[41].content.strip
			@previous = array[40].content.strip			

		when 14
			@answer = array[42].content.strip
			@previous = array[41].content.strip			

		when 15
			@answer = array[43].content.strip
			@previous = array[42].content.strip			

		when 16
			@answer = array[44].content.strip
			@previous = array[43].content.strip			

		when 17
			@answer = array[45].content.strip
			@previous = array[44].content.strip			

		when 18
			@answer = array[46].content.strip
			@previous = array[45].content.strip	

		when 19
			@answer = array[47].content.strip
			@previous = array[46].content.strip			

		when 20
			@answer = array[48].content.strip
			@previous = array[47].content.strip			

		when 21
			@answer = array[49].content.strip
			@previous = array[48].content.strip			

		when 22
			@answer = array[50].content.strip
			@previous = array[49].content.strip			

		when 23
			@answer = array[51].content.strip
			@previous = array[50].content.strip			
		else
			@answer = ":)"
			@previous = ":)"			
		end
		@status = how_bad(@answer)	
		@status2 = how_bad(@previous)
		@color = background(@answer)	
	
	end

	def today

		time = Time.now.hour
		logger.info "hello"
		doc2 = Nokogiri::HTML(open('http://app2.nea.gov.sg/anti-pollution-radiation-protection/air-pollution/psi/psi-and-pm2-5-readings'))
		array = doc2.css('td').to_a

		arrayResult = Array.new
		arrayResult.push(array[14].content.strip)
		arrayResult.push(array[15].content.strip)
		arrayResult.push(array[16].content.strip)
		arrayResult.push(array[17].content.strip)
		arrayResult.push(array[18].content.strip)
		arrayResult.push(array[19].content.strip)
		arrayResult.push(array[20].content.strip)
		arrayResult.push(array[21].content.strip)
		arrayResult.push(array[22].content.strip)
		arrayResult.push(array[23].content.strip)
		arrayResult.push(array[24].content.strip)
		arrayResult.push(array[25].content.strip)
		arrayResult.push(array[40].content.strip)

		arrayResult.push(array[41].content.strip)
		arrayResult.push(array[42].content.strip)
		arrayResult.push(array[43].content.strip)
		arrayResult.push(array[44].content.strip)
		arrayResult.push(array[45].content.strip)
		arrayResult.push(array[46].content.strip)
		arrayResult.push(array[47].content.strip)
		arrayResult.push(array[48].content.strip)
		arrayResult.push(array[49].content.strip)
		arrayResult.push(array[50].content.strip)
		arrayResult.push(array[51].content.strip)
		
		render :json => arrayResult
	end

	def how_bad(psi)

		if psi == "-"
			return ""
		else
			psi = Integer(psi)

			if psi > 0 and psi < 50
				return "Good"
			elsif psi > 50 and psi < 100
				return "Not Good"
			elsif psi > 100 and psi < 200
				return "Unhealthy"
			elsif psi > 200 and psi < 300
				return "Very Unhealthy"
			elsif psi > 300 and psi < 400 
				return "Hazardous"
			elsif psi > 400 and psi < 500
				return "Very Hazardous"
			elsif psi > 500 
				return "Oh My God"
			else
				return "Unconfirmed"
			end

		end
		
	end


	def background(psi)

		if psi == "-"
			return "#95a5a6"
		else
			psi = Integer(psi)
			if psi > 0 and psi < 50
				return "#2ecc71"
			elsif psi > 50 and psi < 100
				return "yellow"
			elsif psi > 100 and psi < 200
				return "#d35400"
			elsif psi > 200 and psi < 300
				return "#e74c3c"
			elsif psi > 300 and psi < 400 
				return "#C0392B"
			elsif psi > 400 and psi < 500
				return "#2c3e50"
			elsif psi > 500 
				return "black"
			else
				return "Unconfirmed"
			end
		end
	end

end
