describe Mailers::BookAddedNotification, type: :mailer do
  subject { described_class }

  after do
    Hanami::Mailer.deliveries.clear
  end

  it 'has correct `from` email address' do
    expect(subject.from).to eq 'no-reply@example.com'
  end

  it 'has correct `to` email address' do
    expect(subject.to).to eq 'admin@example.com'
  end

  it 'has correct subject' do
    expect(subject.subject).to eq 'Book Added!'
  end

  it 'delivers mail' do
    expect {
      subject.deliver
    }.to change { Hanami::Mailer.deliveries.length }.by(1)
  end
end
