module MessagesHelper

    include SendGrid

    def create_mail(msg)
        mail = Mail.new
        mail.from = Email.new(email: current_user.email)
        mail.subject = msg.subject
        personalization = Personalization.new
        personalization.add_to(Email.new(email: current_user.email, name: current_user.name))
        get_recipents(msg.record_ids).each do |recipent|
            personalization.add_bcc(Email.new(email: recipent.email, name: recipent.name))
        end
        personalization.add_custom_arg(CustomArg.new(key: 'user_id', value: current_user.id.to_s))
        personalization.add_custom_arg(CustomArg.new(key: 'message_id', value: Message.maximum(:id).next.to_s))
        mail.add_personalization(personalization)
        mail.add_content(Content.new(type: 'text/plain', value: msg.body))
        mail.add_content(Content.new(type: 'text/html', value: "<html><body>#{msg.body}</body></html>"))
        return mail
    end

    def get_recipents(recipent_ids)
        current_user.owned_records.union(current_user.accessible_records).where(id: recipent_ids)
    end

    def deliver(mail)
        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
        sg.client.mail._('send').post(request_body: mail.to_json)
    end
end
