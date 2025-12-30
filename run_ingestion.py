try:
    from src.components.data_ingestion import DataIngestion
except ModuleNotFoundError as e:
    missing = getattr(e, "name", None) or str(e)
    print("\nMissing required package detected:", missing)
    print("Install dependencies with: pip install -r requirements.txt")
    raise


def main():
    obj = DataIngestion()
    obj.initiate_data_ingestion()


if __name__ == "__main__":
    main()
