NAME := Antrag
PLATFORM := iphoneos
SCHEME := Antrag
TMP := $(if $(TMPDIR),$(TMPDIR),/tmp)/$(NAME)
STAGE := $(TMP)/stage
APP := $(TMP)/Build/Products/Release-$(PLATFORM)
OUTPUT_DIR := packages

.PHONY: all clean $(SCHEME)

all: $(SCHEME)

clean:
	rm -rf $(TMP)
	rm -rf $(OUTPUT_DIR)
	rm -rf Payload

$(SCHEME):
	xcodebuild \
	    -project Antrag.xcodeproj \
	    -scheme "$(SCHEME)" \
	    -configuration Release \
	    -sdk $(PLATFORM) \
	    -derivedDataPath $(TMP) \
	    -skipPackagePluginValidation \
	    -resolvePackageDependencies \
	    clean build \
	    CODE_SIGNING_ALLOWED=NO \
	    CODE_SIGNING_REQUIRED=NO \
	    CODE_SIGN_IDENTITY="" \
	    ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES=NO

	rm -rf Payload
	rm -rf $(STAGE)/
	mkdir -p $(STAGE)/Payload

	mv "$(APP)/$(SCHEME).app" "$(STAGE)/Payload/$(SCHEME).app"

	cp deps/* "$(STAGE)/Payload/$(SCHEME).app/" || true

	rm -rf "$(STAGE)/Payload/$(SCHEME).app/_CodeSignature"
	ln -sf "$(STAGE)/Payload" Payload

	mkdir -p $(OUTPUT_DIR)
	zip -r9 "$(OUTPUT_DIR)/$(SCHEME).ipa" Payload
