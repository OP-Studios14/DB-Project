# Music Events Analytics Database

## Overview

This database is designed to manage information related to **shows, venues, and artists** for an  music event analytics system. It organizes data about where events take place, the performers involved, and how artists are scheduled within each show.

The system allows shows to be scheduled at different venues while supporting multiple artists performing at a single event. It also records important details such as performance times, event descriptions, ticket prices, and venue information.

## Database Structure

The database consists of four main tables:

### VENUE

The `VENUE` table stores information about locations where shows can be held. Each venue has a unique identifier and includes attributes such as the venue name, address, contact phone number, district, and whether the venue is indoor, outdoor or other. A venue can exist in the system even if no shows are currently scheduled there.

### SHOW

The `SHOW` table stores details about individual events. Each show includes a name, start and end dates, ticket price, event type, and a description. Every show is associated with a specific venue through a foreign key relationship, meaning each show takes place at exactly one venue.

### ARTIST

The `ARTIST` table contains information about performers, including their name, musical genre, and the district they are from. Artists can perform at multiple shows across different venues.

### SHOW_ARTISTS

The `SHOW_ARTISTS` table acts as a bridge table that connects artists to shows. Because a show can feature multiple artists and an artist can perform in multiple shows, this table resolves the many-to-many relationship between the `SHOW` and `ARTIST` tables. 

## Relationships

* A **venue can host zero or many shows**, but each show must occur at exactly one venue.
* A **show can feature multiple artists**, and an artist can perform at multiple shows.
* The `SHOW_ARTISTS` table records the participation of artists in shows.

