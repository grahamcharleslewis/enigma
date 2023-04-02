# frozen_string_literal: true

require "sinatra"
require_relative "../enigma/machine"

class App < Sinatra::Application
  set :port, 8080

  get "/" do
    transcoded_message = ""
    error_messages = []

    if params.any?
      rotors = [params["left_rotor"], params["middle_rotor"], params["right_rotor"]]
      error_messages << "Incorrect rotor selection: #{rotors}" unless rotors.uniq.count == 3
      error_messages << "No message given" if params["message"] == ""

      unless error_messages.any?
        machine = Machine.new
        machine.configure(
          [params["left_rotor"], params["middle_rotor"], params["right_rotor"]],
          params["reflector"]
        )
        transcoded_message = machine.transcode_string(params["message"])
      end
    end

    erb :index, locals: {
      error_messages: error_messages,
      transcoded_message: transcoded_message,
      message: params["message"] || "",
      left_rotor: params["left_rotor"] || "I",
      middle_rotor: params["middle_rotor"] || "II",
      right_rotor: params["right_rotor"] || "III",
      reflector: params["reflector"] || "A"
    }
  end
end
