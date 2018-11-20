# vim: foldmethod=marker
#
RSpec.describe Brl do
  describe '::parse_as_brl' do
    it 'should parse correctly' do
      # Examples. {{{
      expect(Brl.parse_as_brl('1.1')).to eq('1.10 BRL')
      expect(Brl.parse_as_brl('1')).to eq('1.00 BRL')
      expect(Brl.parse_as_brl('1.1 BRL')).to eq('1.10 BRL')
      expect(Brl.parse_as_brl('1.99')).to eq('1.99 BRL')
      expect(Brl.parse_as_brl('0.1')).to eq('0.10 BRL')

      expect(Brl.parse_as_brl('1999.11')).to eq('1999.11 BRL')
      expect(Brl.parse_as_brl('1.999.11')).to eq('1999.11 BRL')
      # }}}
    end

    it 'should parse from R$' do
      # Examples. {{{
      expect(Brl.parse_as_brl('R$1.0')).to eq('1.00 BRL')
      expect(Brl.parse_as_brl('R$1.10')).to eq('1.10 BRL')
      expect(Brl.parse_as_brl('R$1.99')).to eq('1.99 BRL')
      expect(Brl.parse_as_brl('R$1.9')).to eq('1.90 BRL')
      expect(Brl.parse_as_brl('R$0.01')).to eq('0.01 BRL')
      expect(Brl.parse_as_brl('R$ 1.01')).to eq('1.01 BRL')
      expect(Brl.parse_as_brl('R$ 0.01')).to eq('0.01 BRL')

      expect(Brl.parse_as_brl('R$ 1.999,01')).to eq('1999.01 BRL')
      expect(Brl.parse_as_brl('R$ 1999,01')).to eq('1999.01 BRL')
      # }}}
    end
  end

  describe '::parse_as_rs' do
    it 'should parse correctly' do
      # Examples. {{{
      expect(Brl.parse_as_rs('1.1')).to eq('R$1,10')
      expect(Brl.parse_as_rs('1')).to eq('R$1,00')
      expect(Brl.parse_as_rs('R$1.1')).to eq('R$1,10')
      expect(Brl.parse_as_rs('R$ 1,10')).to eq('R$1,10')
      expect(Brl.parse_as_rs('1.99')).to eq('R$1,99')
      expect(Brl.parse_as_rs('0.1')).to eq('R$0,10')

      expect(Brl.parse_as_rs('1.999.11')).to eq('R$1.999,11')
      expect(Brl.parse_as_rs('1999.11')).to eq('R$1.999,11')
      # }}}
    end

    it 'should parse from BRL' do
      # Examples. {{{
      expect(Brl.parse_as_rs('1.11 BRL')).to eq('R$1,11')
      expect(Brl.parse_as_rs('1111.11 BRL')).to eq('R$1.111,11')
      expect(Brl.parse_as_rs('1.999.11 BRL')).to eq('R$1.999,11')
      # }}}
    end
  end

end
