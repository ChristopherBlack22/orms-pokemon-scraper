class Pokemon
    attr_accessor :name, :type, :db, :id

    def initialize(id: nil, name:, type:, db:)
        @name = name
        @type = type
        @id = id
    end 

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?,?)"
        db.execute(sql, name, type)
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0] 
    end 

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        db_record = db.execute(sql, id).flatten 
        new_pokemon = Pokemon.new(id: db_record[0], name: db_record[1], type: db_record[2], db: db)
    end 

end
