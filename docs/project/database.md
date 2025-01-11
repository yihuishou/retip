# Retip local database

```mermaid
erDiagram

Track {
    int id PK
    int album FK
    int artist FK
    String name
    Uri path
    Duration duration
    DateTime accessed
    DateTime modified
    DateTime created
    bool favourite
}

Album {
    int id PK
    int artist FK
    int artwork FK
    int List~Track~ tracks FK
    String name
    int year
    bool favourite
}

Artist {
    int id PK
    int photo FK
    int List~Album~ albums FK
    String name
    bool favourite
}

Genre {
    int id PK
    int List~Track~ tracks FK
    String name
    bool favourite
}

Playlist {
    int id PK
    int List~Track~ tracks FK
    String name
    DateTime accessed
    DateTime modified
    DateTime created
    bool favourite
}

Artwork {
    int id PK
    Uri path
}

Photo {
    int id PK
    Uri path
}

Track ||--|{ Album: ""
Album ||--|{ Artist: ""
Artist ||--|| Photo: ""


Track ||--|{ Artist: ""
Track ||--|{ Genre: ""
Track ||--|{ Playlist: ""

Album ||--|| Artwork: ""
```