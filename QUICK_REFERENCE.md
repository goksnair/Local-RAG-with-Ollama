# Quick Reference - RAG Ollama Setup

## 🚀 **Start Application**
```bash
cd /Users/gokulnair/Desktop/RAG-OLLAMA/Local-RAG-with-Ollama
source rag_env/bin/activate
python run_app.py
# Access: http://localhost:8000
```

## 🔧 **Key Technical Details**
- **Python**: 3.13 (using Ollama embeddings for compatibility)
- **Embedding Model**: mxbai-embed-large (via Ollama)
- **LLM Model**: gemma3:4b-it-qat
- **Framework**: Reflex web framework

## 📦 **Dependencies Fixed**
- ❌ Removed: PyTorch, sentence-transformers (Python 3.13 incompatible)
- ✅ Using: OllamaEmbeddings instead of HuggingFaceEmbeddings

## 🔗 **Repository**
- **GitHub**: https://github.com/goksnair/Local-RAG-with-Ollama
- **Auth**: SSH key configured
- **Status**: All changes committed and pushed

## 🔄 **Recovery Commands**
```bash
# Quick clone and setup
git clone git@github.com:goksnair/Local-RAG-with-Ollama.git
cd Local-RAG-with-Ollama
python3.13 -m venv rag_env
source rag_env/bin/activate
pip install -r requirements.txt
ollama pull gemma3:4b-it-qat
ollama pull mxbai-embed-large
python run_app.py
```

## 📝 **Key Files Modified**
- `rag_gemma_reflex/rag_logic.py` - Switched to OllamaEmbeddings
- `run_app.py` - Custom startup script
- `start_rag_app.sh` - Bash launcher
- `update_github.sh` - Git automation

**Session Date**: July 25, 2025  
**Status**: ✅ COMPLETE - All objectives achieved
