using Megaminds_prectical.Model;
using Microsoft.Win32.SafeHandles;
using System.Runtime.InteropServices;

namespace Megaminds_prectical.DAL
{
    public class BaseRepository : IDisposable
    {
        bool disposed = false;
        SafeHandle handle = new SafeFileHandle(IntPtr.Zero, true);

        public string ConnectionString
        {
            get
            {
                return Common.ConnectionString;
            }
        }

        #region Dispose
        public void Dispose()
        {
            // Dispose of unmanaged resources.
            Dispose(true);
            // Suppress finalization.
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposed)
                return;

            if (disposing)
            {
                handle.Dispose();
                // Free any other managed objects here.
                //
            }

            // Free any unmanaged objects here.
            //
            disposed = true;
        }

        #endregion


    }
}
