class Novel < ActiveRecord::Base
    belongs_to :user

    validates :title, presence: true, length: { minimum: 5 }
    validates :description, presence: true
    validates :title, :uniqueness => { :message => "El titulo de esta novalea ya ha sido tomado" }
    resourcify

    mount_uploaders :build, BuildUploader
    mount_uploaders :templatedata, TemplatedataUploader

    
    # attr_accessor :build

    # after_save :save_build_file, if: :build

    # def save_build_file
    #     filename = build.original_filename
    #     folder   = "public/novels/#{id}/build"

    #     FileUtils::mkdir_p folder

    #     f = File.open File.join(folder, filename), "wb"
    #     f.write build.read()
    #     f.close

    #     self.build = nil
    #     update build_filename: filename
    # end
end
