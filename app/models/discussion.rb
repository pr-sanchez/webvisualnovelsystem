class Discussion < ActiveRecord::Base

    belongs_to :channel
    belongs_to :user
    has_many :replies, dependent: :destroy

    validates :title, presence: { :message => "El titulo no puede estar vacio" }, length: { minimum: 5, :message => "El Título es muy corto (El minimo es 5 carácteres)"  }
    validates :content, presence: { :message => "El Contenido no puede estar vacio" }
    validates :channel, presence: { :message => "El Tema no puede estar vacio" }
    validates :title, :uniqueness => { :message => "El titulo de esto post ya ha sido tomado" }
    validate :channel_existing
    resourcify

    extend FriendlyId 
    friendly_id :title, use: [:slugged, :finders]

    def should_generate_new_friendly_id?
        title_changed?
    end

    private
    def channel_existing
        errors.add(:channel_id, :missing) if channel.blank?
    end
end
