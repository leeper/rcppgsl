# Copyright (C)        2010 Romain Francois and Dirk Eddelbuettel
#
# This file is part of RcppGSL.
#
# RcppGSL is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# RcppGSL is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with RcppGSL.  If not, see <http://www.gnu.org/licenses/>.

test <- function( output = if( file.exists( "/tmp" ) ) "/tmp" else getwd() ){
	if( !file.exists( output ) ){ stop( "output directory does not exist" ) }

	Rscript <- file.path( R.home( component = "bin" ), "Rscript" )
	if( .Platform$OS.type == "windows" ){
		Rscript <- sprintf( "%s.exe", Rscript )
	}
	test.script <- system.file( "unitTests", "runTests.R", package = "RcppGSL" )
	cmd <- sprintf( '"%s" "%s" --output=%s', Rscript, test.script, output )
	system( cmd )
}

