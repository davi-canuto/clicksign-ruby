require 'clicksign'

Clicksign.configure do |config|
  config.token = ENV['CLICKSIGN_TOKEN']
  config.environment = :sandbox
end

# Create a envelope
envelope = Clicksign::Envelope.create({ name: 'test envelope' })

# Get Key identification
envelope_id = envelope['data']['id']

# Add a new document to signature
document = Clicksign::Document.new(envelope_id).create(
  { 
    filename: 'samplename.jpg', 
    content_base64: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJwAAACACAYAAAD+rACtAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAAFeSURBVHhe7dIxAQAgDMCwgX/NwIOGXslTA13n3DsQ2b+QMBwpw5EyHCnDkTIcKcORMhwpw5EyHCnDkTIcKcORMhwpw5EyHCnDkTIcKcORMhwpw5EyHCnDkTIcKcORMhwpw5EyHCnDkTIcKcORMhwpw5EyHCnDkTIcKcORMhwpw5EyHCnDkTIcKcORMhwpw5EyHCnDkTIcKcORMhwpw5EyHCnDkTIcKcORMhwpw5EyHCnDkTIcKcORMhwpw5EyHCnDkTIcKcORMhwpw5EyHCnDkTIcKcORMhwpw5EyHCnDkTIcKcORMhwpw5EyHCnDkTIcKcORMhwpw5EyHCnDkTIcKcORMhwpw5EyHCnDkTIcKcORMhwpw5EyHCnDkTIcKcORMhwpw5EyHCnDkTIcKcORMhwpw5EyHCnDkTIcKcORMhwpw5EyHCnDkTIcKcORMhwpw5EyHCnDkTIcKcMRmnltlQT6RDW/pgAAAABJRU5ErkJggg==", 
  }
)

# Add a new signer to signature
signer = Clicksign::Signer.new(envelope_id).create(
  { 
    name: 'segundin',
    email: 'mudin@mail.com',
    birthdate: '1990-01-01'
  }
)