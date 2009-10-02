
include userconfig.mk

TARGET=$(NAME).pdf
TEXFILE=$(NAME).tex

$(TARGET): $(TEXFILE)
	$(PDF_BUILDER) $(TEXFILE)
	$(PDF_BUILDER) $(TEXFILE)
	$(PDF_BUILDER) $(TEXFILE)

all: $(TARGET)

.PHONY: clean more quick clean-lite

clean-lite:
	rm -f $(NAME).aux $(NAME).log $(NAME).toc $(NAME).out

more:
	$(PDF_BUILDER) $(TEXFILE)
	
clean:
	rm -f $(NAME).aux $(NAME).log $(NAME).toc $(NAME).out $(TARGET)

git-clean:
	rm -f $(NAME).aux $(NAME).log $(NAME).toc $(NAME).out $(TARGET) *~

quick:
	$(PDF_BUILDER) $(TEXFILE)
	$(PDF_VIEWER) $(TARGET) &

extra:
	$(PDF_BUILDER) $(TEXFILE)
	$(PDF_BUILDER) $(TEXFILE)
	$(PDF_BUILDER) $(TEXFILE)
	$(PDF_BUILDER) $(TEXFILE)
	$(PDF_BUILDER) $(TEXFILE)
	$(PDF_BUILDER) $(TEXFILE)
	$(PDF_BUILDER) $(TEXFILE)
	$(PDF_BUILDER) $(TEXFILE)
	$(PDF_BUILDER) $(TEXFILE)
	$(PDF_BUILDER) $(TEXFILE)
