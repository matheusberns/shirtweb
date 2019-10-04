namespace :dev do
  desc "Configura ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Dropping database...") {%x(rails db:drop)}
      show_spinner("Creating database...") {%x(rails db:create)}
      show_spinner("Migrating database...") {%x(rails db:migrate)}
      %x(rails dev:add_departments)
      %x(rails dev:add_admin)
    else
      puts "You aren't in development mode!"
    end
  end

  desc "Cria usuário admin"
  task add_admin: :environment do
    show_spinner("Registering default admin user...") do
      admin = {
          email: "admin@admin.com",
          encrypted_password: "M@th3us!#",
          role: "admin"
      }
      User.find_or_create_by(admin)

    end
  end

  desc "Cadastra os departamentos"
  task add_departments: :environment do
    show_spinner("Registering departments...") do
      department = [
          {nome: "Gatos"},
          {nome: "Cães"}
      ]
      department.each do |department|
        Department.find_or_create_by(department)
      end
    end
  end

  private

  def show_spinner(msg_start, msg_end = "Done!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end