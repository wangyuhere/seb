# Seb

It extracts data from exported xlsx file of SEB bank statments and generates a financial report.

## Installation

    $ gem install seb

## Usage

Login to SEB private bank, go to "Mina konton", click "Kontohändelser" and download the exported the .xlsx file.
Click "Exportera till kalkylblad (xls)" to export:

![SEB screen shot](https://api0-ams1.monosnap.com/static/IutKg0hszJuCy6SF9pqneLYrP0pHAD.png)

Then run:

    $ seb report Export.xlsx
    +---------+-------------------------+
    |              Summary              |
    +---------+-------------------------+
    | Name    | Rex                     |
    | Account | 12345678                |
    | Dates   | 2014-04-14 ~ 2014-08-14 |
    | Balance | 1000.0                  |
    | Expense | 500.0                   |
    | Income  | 1100.0                  |
    +---------+-------------------------+
    +---------+---------+--------+---------+
    |            Group by Month            |
    +---------+---------+--------+---------+
    | Month   | Expense | Income | Balance |
    +---------+---------+--------+---------+
    | 2014-08 | 200.0   | 1000.0 | 800.0   |
    | 2014-07 | 100.0   | 0.0    | -100.0  |
    | 2014-06 | 100.0   | 0.0    | -100.0  |
    | 2014-05 | 100.0   | 0.0    | -100.0  |
    | 2014-04 | 0.0     | 100.0  | 100.0   |
    +---------+---------+--------+---------+

## Contributing

1. Fork it ( https://github.com/[my-github-username]/seb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
