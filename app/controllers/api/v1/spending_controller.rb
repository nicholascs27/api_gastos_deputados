class Api::V1::SpendingController < ApplicationController

  require 'csv'
  
  def import
    ActiveRecord::Base.transaction do
      text = File.read(params[:file].path).delete('"')
      text = text.gsub(';', ',')
      CSV.parse(text, headers: true, header_converters: :symbol) do |row|
        next if row[:sguf] != 'CE'
        
        congressperson = Congressperson.find_or_create_by(
          name: row[:txnomeparlamentar], 
          cpf: row[:cpf],
          uf: row[:sguf],
          political_party: row[:sgpartido],
          id_external: row[:idecadastro]
        )

        spent = Spent.find_or_create_by(
          congressperson_id: congressperson.id, 
          description: row[:txtdescricao], 
          provider: row[:txtfornecedor], 
          value: row[:vlrliquido], 
          issuance_date: row[:datemissao],
          month: row[:nummes], 
          document_url: row[:urldocumento]
        )
      end

      sum_spending = Spent.
        group(:congressperson_id).
        select(:congressperson_id, 'SUM(value) AS total')

      sum_spending.each do |result|
        yearly_spend = YearlySpend.new
        yearly_spend.congressperson_id = result.congressperson_id
        yearly_spend.year = Spent.first.issuance_date.year
        yearly_spend.total = result.total
        yearly_spend.save
      end

      render json: {message: "Importação realizada com sucesso!"}
    rescue => e
      render json: { error: e.message}
    end
  end

  def index
    spents = Spent.all
    render json: spents.map { |spent| spent.slice(:issuance_date, :provider, :value, :document_url) }.to_json
  end
end
