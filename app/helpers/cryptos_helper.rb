module CryptosHelper
    def current_crypto
        @current_crypto ||= Crypto.find_by_id(params[:crypto_id])
    end
end
